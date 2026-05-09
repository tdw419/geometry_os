; DESCRIPTION: Places a white 103x48 rectangle at position (350, 16).
; PLAN: r0=350(x), r1=16(y), r2=103(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 16
LDI r2, 103
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
