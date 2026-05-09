; DESCRIPTION: Places a white circle of radius 16 at center (320, 143).
; PLAN: r0=320(x), r1=143(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 143
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
