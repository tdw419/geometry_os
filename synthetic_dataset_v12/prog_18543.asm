; DESCRIPTION: Renders a cyan disk with center (401, 96) and radius 72.
; PLAN: r0=401(x), r1=96(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 96
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
