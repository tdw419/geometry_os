; DESCRIPTION: Places a orange 39x64 rectangle at position (186, 182).
; PLAN: r0=186(x), r1=182(y), r2=39(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 182
LDI r2, 39
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
