; DESCRIPTION: Places a cyan circle of radius 71 at center (154, 180).
; PLAN: r0=154(x), r1=180(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 180
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
