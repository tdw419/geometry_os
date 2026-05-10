; DESCRIPTION: Creates a white filled rectangle of size 113x100 starting at (398, 184).
; PLAN: r0=398(x), r1=184(y), r2=113(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 184
LDI r2, 113
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
