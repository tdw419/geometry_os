; DESCRIPTION: Composite: . Then Renders a black line between points (254, 33) and (206, 164). Then Renders a red box of size 97x37 starting at (92, 124).
; PLAN: r0=254(x1), r1=33(y1), r2=206(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=92(x), r1=124(y), r2=97(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (254, 33) and (206, 164).
; PLAN: r0=254(x1), r1=33(y1), r2=206(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 33
LDI r2, 206
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 97x37 starting at (92, 124).
; PLAN: r0=92(x), r1=124(y), r2=97(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 124
LDI r2, 97
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
