; DESCRIPTION: Places a cyan circle of radius 77 at center (173, 117).
; PLAN: r0=173(x), r1=117(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 117
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
