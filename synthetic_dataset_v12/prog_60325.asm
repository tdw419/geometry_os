; DESCRIPTION: Places a magenta circle of radius 13 at center (410, 173).
; PLAN: r0=410(x), r1=173(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 173
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
