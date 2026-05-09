; DESCRIPTION: Places a red 28x46 rectangle at position (135, 124).
; PLAN: r0=135(x), r1=124(y), r2=28(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 124
LDI r2, 28
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
