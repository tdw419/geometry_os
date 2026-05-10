; DESCRIPTION: Composite: Places a magenta dot at position (362, 114) then Renders a yellow box of size 71x41 starting at (96, 151).
; PLAN: r0=362(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=151(y), r7=71(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 151
LDI r7, 71
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
