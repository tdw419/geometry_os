; DESCRIPTION: Places a white 27x20 rectangle at position (128, 204).
; PLAN: r0=128(x), r1=204(y), r2=27(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 204
LDI r2, 27
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
