; DESCRIPTION: Renders a white line between points (416, 173) and (176, 50).
; PLAN: r0=416(x1), r1=173(y1), r2=176(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 173
LDI r2, 176
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
