; DESCRIPTION: Composite: Places a magenta dot at position (456, 65) then Places a yellow 60x48 rectangle at position (67, 137).
; PLAN: r0=456(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=137(y), r7=60(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 65
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 137
LDI r7, 60
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
