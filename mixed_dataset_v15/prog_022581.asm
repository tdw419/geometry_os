; DESCRIPTION: Composite: Places a white 46x64 rectangle at position (71, 63) then Renders a blue line between points (170, 3) and (243, 23).
; PLAN: r0=71(x), r1=63(y), r2=46(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x1), r6=3(y1), r7=243(x2), r8=23(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 63
LDI r2, 46
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 3
LDI r7, 243
LDI r8, 23
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
