; DESCRIPTION: Places a cyan line segment connecting (174, 152) to (403, 67).
; PLAN: r0=174(x1), r1=152(y1), r2=403(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 152
LDI r2, 403
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
