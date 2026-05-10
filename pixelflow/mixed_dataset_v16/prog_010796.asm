; DESCRIPTION: Places a cyan line segment connecting (487, 79) to (346, 14).
; PLAN: r0=487(x1), r1=79(y1), r2=346(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 79
LDI r2, 346
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
