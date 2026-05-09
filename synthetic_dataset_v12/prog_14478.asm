; DESCRIPTION: Renders a white box of size 28x97 starting at (356, 113).
; PLAN: r0=356(x), r1=113(y), r2=28(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 113
LDI r2, 28
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
