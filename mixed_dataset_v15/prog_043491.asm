; DESCRIPTION: Renders a cyan line between points (401, 209) and (321, 204).
; PLAN: r0=401(x1), r1=209(y1), r2=321(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 209
LDI r2, 321
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
