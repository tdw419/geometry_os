; DESCRIPTION: Renders a white line between points (135, 242) and (425, 111).
; PLAN: r0=135(x1), r1=242(y1), r2=425(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 242
LDI r2, 425
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
