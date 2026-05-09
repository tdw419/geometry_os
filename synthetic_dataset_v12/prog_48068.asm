; DESCRIPTION: Renders a cyan line between points (403, 206) and (280, 0).
; PLAN: r0=403(x1), r1=206(y1), r2=280(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 206
LDI r2, 280
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
