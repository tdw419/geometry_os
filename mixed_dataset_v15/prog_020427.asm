; DESCRIPTION: Places a red 56x63 rectangle at position (289, 57).
; PLAN: r0=289(x), r1=57(y), r2=56(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 57
LDI r2, 56
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
