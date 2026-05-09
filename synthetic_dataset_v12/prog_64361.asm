; DESCRIPTION: Renders a cyan line between points (455, 103) and (502, 152).
; PLAN: r0=455(x1), r1=103(y1), r2=502(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 103
LDI r2, 502
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
