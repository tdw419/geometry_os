; DESCRIPTION: Composite: Renders a blue disk with center (410, 130) and radius 63 then Draws a blue line from (98, 180) to (125, 92) then Places a cyan 109x16 rectangle at position (103, 99).
; PLAN: r0=410(x), r1=130(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=180(y1), r7=125(x2), r8=92(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=99(y), r12=109(width), r13=16(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 130
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 180
LDI r7, 125
LDI r8, 92
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 99
LDI r12, 109
LDI r13, 16
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
