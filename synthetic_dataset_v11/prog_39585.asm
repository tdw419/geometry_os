; DESCRIPTION: Places a cyan circle of radius 59 at center (123, 113).
; PLAN: r0=123(x), r1=113(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 113
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
