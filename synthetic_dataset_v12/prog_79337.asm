; DESCRIPTION: Places a green 39x61 rectangle at position (120, 0).
; PLAN: r0=120(x), r1=0(y), r2=39(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 0
LDI r2, 39
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
