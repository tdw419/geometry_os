; DESCRIPTION: Composite: Places a black 36x40 rectangle at position (258, 175) then Renders a white line between points (435, 210) and (387, 243).
; PLAN: r0=258(x), r1=175(y), r2=36(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=210(y1), r7=387(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 175
LDI r2, 36
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 210
LDI r7, 387
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
