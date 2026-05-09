; DESCRIPTION: Renders a red box of size 103x46 starting at (405, 177).
; PLAN: r0=405(x), r1=177(y), r2=103(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 177
LDI r2, 103
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
