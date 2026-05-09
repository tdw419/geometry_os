; DESCRIPTION: Renders a cyan disk with center (150, 152) and radius 61.
; PLAN: r0=150(x), r1=152(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 152
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
