; DESCRIPTION: Renders a cyan line segment connecting (198, 196) to (346, 133).
; PLAN: r0=198(x1), r1=196(y1), r2=346(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 196
LDI r2, 346
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
