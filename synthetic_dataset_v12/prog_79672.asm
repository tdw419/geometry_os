; DESCRIPTION: Composite: Renders a red box of size 84x114 starting at (169, 24) then Places a blue dot at position (124, 243).
; PLAN: r0=169(x), r1=24(y), r2=84(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=243(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 24
LDI r2, 84
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 243
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
