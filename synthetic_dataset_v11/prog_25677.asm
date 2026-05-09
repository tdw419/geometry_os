; DESCRIPTION: Renders a green line between points (48, 146) and (224, 209).
; PLAN: r0=48(x1), r1=146(y1), r2=224(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 146
LDI r2, 224
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
