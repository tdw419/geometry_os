; DESCRIPTION: Places a white 50x72 rectangle at position (358, 91).
; PLAN: r0=358(x), r1=91(y), r2=50(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 91
LDI r2, 50
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
