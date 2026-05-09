; DESCRIPTION: Places a green 98x100 rectangle at position (346, 21).
; PLAN: r0=346(x), r1=21(y), r2=98(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 21
LDI r2, 98
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
