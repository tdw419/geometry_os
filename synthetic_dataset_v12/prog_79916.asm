; DESCRIPTION: Renders a green line between points (346, 242) and (464, 179).
; PLAN: r0=346(x1), r1=242(y1), r2=464(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 242
LDI r2, 464
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
