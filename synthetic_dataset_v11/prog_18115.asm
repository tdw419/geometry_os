; DESCRIPTION: Places a green circle of radius 27 at center (82, 113).
; PLAN: r0=82(x), r1=113(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 113
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
