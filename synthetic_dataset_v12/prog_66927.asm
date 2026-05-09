; DESCRIPTION: Renders a white line between points (479, 79) and (103, 154).
; PLAN: r0=479(x1), r1=79(y1), r2=103(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 79
LDI r2, 103
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
