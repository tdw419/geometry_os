; DESCRIPTION: Renders a cyan line between points (308, 153) and (401, 249).
; PLAN: r0=308(x1), r1=153(y1), r2=401(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 153
LDI r2, 401
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
