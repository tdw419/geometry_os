; DESCRIPTION: Renders a cyan line between points (224, 23) and (487, 25).
; PLAN: r0=224(x1), r1=23(y1), r2=487(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 23
LDI r2, 487
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
