; DESCRIPTION: Renders a white line between points (213, 205) and (401, 198).
; PLAN: r0=213(x1), r1=205(y1), r2=401(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 205
LDI r2, 401
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
