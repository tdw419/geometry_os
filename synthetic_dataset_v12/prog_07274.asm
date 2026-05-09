; DESCRIPTION: Draws a white line from (440, 173) to (507, 57).
; PLAN: r0=440(x1), r1=173(y1), r2=507(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 173
LDI r2, 507
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
