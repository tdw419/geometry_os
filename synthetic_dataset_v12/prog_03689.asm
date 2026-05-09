; DESCRIPTION: Creates a orange rectangular region at (262, 131) spanning 21 by 64 pixels.
; PLAN: r0=262(x), r1=131(y), r2=21(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 131
LDI r2, 21
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
