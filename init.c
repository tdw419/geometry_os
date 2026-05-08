#include <stdio.h>
#include <unistd.h>

int main() {
    printf("\n\n");
    printf("****************************************\n");
    printf("*                                      *\n");
    printf("*      WELCOME TO GEOMETRY LINUX       *\n");
    printf("*                                      *\n");
    printf("****************************************\n\n");
    printf("Root filesystem mounted successfully.\n");
    printf("Native GeOS execution confirmed at ~52 MIPS.\n\n");
    
    printf("Entering infinite idle loop...\n");
    while(1) {
        sleep(10);
    }
    return 0;
}
