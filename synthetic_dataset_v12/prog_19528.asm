; DESCRIPTION: Renders a cyan disk with center (401, 117) and radius 79.
; PLAN: r0=401(x), r1=117(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 117
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
