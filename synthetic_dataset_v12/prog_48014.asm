; DESCRIPTION: Renders a red box of size 82x102 starting at (152, 50).
; PLAN: r0=152(x), r1=50(y), r2=82(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 50
LDI r2, 82
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
