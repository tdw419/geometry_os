; DESCRIPTION: Places a green 103x48 rectangle at position (173, 0).
; PLAN: r0=173(x), r1=0(y), r2=103(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 0
LDI r2, 103
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
