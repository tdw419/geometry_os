; DESCRIPTION: Renders a cyan line between points (281, 152) and (259, 178).
; PLAN: r0=281(x1), r1=152(y1), r2=259(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 152
LDI r2, 259
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
