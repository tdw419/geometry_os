; DESCRIPTION: Places a cyan circle of radius 31 at center (404, 42).
; PLAN: r0=404(x), r1=42(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 42
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
