; DESCRIPTION: Places a white 71x52 rectangle at position (210, 200).
; PLAN: r0=210(x), r1=200(y), r2=71(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 200
LDI r2, 71
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
