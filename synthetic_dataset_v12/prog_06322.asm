; DESCRIPTION: Renders a cyan disk with center (374, 229) and radius 16.
; PLAN: r0=374(x), r1=229(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 229
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
