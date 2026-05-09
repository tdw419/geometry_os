; DESCRIPTION: Places a white 52x91 rectangle at position (206, 80).
; PLAN: r0=206(x), r1=80(y), r2=52(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 80
LDI r2, 52
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
