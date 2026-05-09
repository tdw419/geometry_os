; DESCRIPTION: Renders a cyan line between points (152, 168) and (171, 255).
; PLAN: r0=152(x1), r1=168(y1), r2=171(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 168
LDI r2, 171
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
