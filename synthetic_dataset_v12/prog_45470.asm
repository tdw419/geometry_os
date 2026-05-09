; DESCRIPTION: Renders a red line between points (242, 129) and (480, 59).
; PLAN: r0=242(x1), r1=129(y1), r2=480(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 129
LDI r2, 480
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
