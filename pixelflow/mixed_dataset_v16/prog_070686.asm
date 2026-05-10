; DESCRIPTION: Composite: Places a magenta dot at position (307, 40) then Places a yellow 108x34 rectangle at position (117, 27).
; PLAN: r0=307(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=27(y), r7=108(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 40
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 27
LDI r7, 108
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
