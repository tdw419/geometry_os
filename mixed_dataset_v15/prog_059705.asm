; DESCRIPTION: Places a yellow circle of radius 57 at center (320, 146).
; PLAN: r0=320(x), r1=146(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 146
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
