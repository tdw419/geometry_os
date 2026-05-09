; DESCRIPTION: Renders a white line between points (171, 191) and (450, 239).
; PLAN: r0=171(x1), r1=191(y1), r2=450(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 191
LDI r2, 450
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
