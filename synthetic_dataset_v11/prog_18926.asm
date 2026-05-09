; DESCRIPTION: Places a cyan circle of radius 42 at center (45, 113).
; PLAN: r0=45(x), r1=113(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 113
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
