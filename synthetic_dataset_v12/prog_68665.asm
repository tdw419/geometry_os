; DESCRIPTION: Places a white 56x64 rectangle at position (281, 75).
; PLAN: r0=281(x), r1=75(y), r2=56(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 75
LDI r2, 56
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
